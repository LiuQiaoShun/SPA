package online.qsx.controller;

import online.qsx.model.User;
import online.qsx.server.UserServer;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.UUID;

@Controller
@RequestMapping("user")
public class UserController{
    @Autowired
    private UserServer userServer;

    //http://localhost:8080/SPA/user/del
    @RequestMapping("/del") //��̨����ɾ������
    public void batchDeletes(HttpServletRequest request, HttpServletResponse response) {
        String items = request.getParameter("delitems");// System.out.println(items);
        String[] strs = items.split(",");

        for (int i = 0; i < strs.length; i++) {
            try {
                int a = Integer.parseInt(strs[i]);
                userServer.delUserById(a);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    //http://localhost:8080/SPA/user/list
    @RequestMapping(value = "list",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView list(ModelAndView mav, User user,@RequestParam(defaultValue = "1") int pageNum){
        mav.addObject("pageInfo",userServer.findAllUser(user,pageNum));
        mav.addObject("pageNum",pageNum);
        mav.addObject("user",user);
        mav.setViewName("user/list");
        return mav;
    }

    //http://localhost:8080/SPA/user/action
    @RequestMapping(value = "action",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView action(ModelAndView mav, User user,@RequestParam(defaultValue = "1") int pageNum){
        mav.addObject("pageInfo",userServer.findAllUser(user,pageNum));
        mav.addObject("pageNum",pageNum);
        mav.setViewName("vocation/action");
        return mav;
    }

    @RequestMapping(value = "password",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView password(ModelAndView mav, User user,@RequestParam(defaultValue = "1") int pageNum){
        mav.addObject("pageInfo",userServer.findAllUser(user,pageNum));
        mav.addObject("pageNum",pageNum);
        mav.setViewName("password/password");
        return mav;
    }

    @RequestMapping(value = "hobby",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView hobby(ModelAndView mav, User user,@RequestParam(defaultValue = "1") int pageNum){
        mav.addObject("pageInfo",userServer.findAllUser(user,pageNum));
        mav.addObject("pageNum",pageNum);
        mav.setViewName("hobby/hobby");
        return mav;
    }

    @RequestMapping(value = "remove",method = {RequestMethod.GET,RequestMethod.POST})
    public String remove(User user){
        userServer.remove(user);
        return "redirect:list";
    }

    @RequestMapping(value = "deletePwd",method = {RequestMethod.GET,RequestMethod.POST})
    public String deletePwd(User user){
        userServer.remove(user);
        return "redirect:password";
    }


    @RequestMapping(value = "delete_hobby",method = {RequestMethod.GET,RequestMethod.POST})
    public String delete_hobby(User user){
        userServer.remove(user);
        return "redirect:hobby";
    }

    @RequestMapping(value = "delete",method = {RequestMethod.GET,RequestMethod.POST})
    public String delete(User user){
        userServer.remove(user);
        return "redirect:action";
    }

    //����ɾ�� json string����
    //http://localhost:8080/SPA/user/deleteSelectUser
    @RequestMapping(value = "deleteSelectUser",method = {RequestMethod.GET,RequestMethod.POST})
//    @ResponseBody
    public String deleteSelectUser(int[]id){
        userServer.deleteArrayUserId(id);
        return "redirect:list";
    }

    @RequestMapping(value = "to_edit",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView to_edit(ModelAndView mav,User user){
        mav.addObject("user",userServer.findUserById(user));
        mav.setViewName("user/edit");
        return mav;
    }

    @RequestMapping(value = "to_editHobby",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView to_editHobby(ModelAndView mav,User user){
        mav.addObject("user",userServer.findUserById(user));
        mav.setViewName("hobby/editHobby");
        return mav;
    }

    @RequestMapping(value = "to_editVocation",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView to_editVocation(ModelAndView mav,User user){
        mav.addObject("user",userServer.findUserById(user));
        mav.setViewName("vocation/editVocation");
        return mav;
    }

    @PostMapping("do_editHobby")
    public String do_editHobby(User user){
        userServer.edit(user);
        return "redirect:hobby";
    }

    @PostMapping("do_editVocation")
    public String do_editVocation(User user){
        userServer.edit(user);
        return "redirect:action";
    }

    @PostMapping("do_edit")
    public String do_edit(User user){
        userServer.edit(user);
        return "redirect:list";
    }

    @RequestMapping(value = "to_update",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView to_update(ModelAndView mav,User user){
        mav.addObject("user",userServer.findUserById(user));
        mav.setViewName("password/update");
        return mav;
    }
    @RequestMapping(value = "do_update",method = {RequestMethod.GET,RequestMethod.POST})
    public String do_update(User user){
        userServer.edit(user);
        return "redirect:password";
    }

    //http://localhost:8080/SPA/user/to_save
    @RequestMapping(value = "to_save",method = {RequestMethod.POST,RequestMethod.GET})
    public String to_save() {
        return "user/add";
    }

    @RequestMapping(value = "do_save",method = {RequestMethod.POST,RequestMethod.GET})
    public String do_save(User user){
        userServer.save(user);
        return "redirect:list";
    }

    //http://localhost:8080/SPA/user/to_add
    @RequestMapping(value = "to_add", method = { RequestMethod.GET, RequestMethod.POST })
    public String to_add() {
        return "vocation/save";
    }

    @RequestMapping(value = "do_add", method = { RequestMethod.GET, RequestMethod.POST })
    public String do_add(User user) {
        userServer.save(user);
        return "redirect:action";
    }


    @RequestMapping(value = "to_increase", method = { RequestMethod.GET, RequestMethod.POST })
    public String to_increase() {
        return "hobby/increase";
    }

    @RequestMapping(value = "do_increase", method = { RequestMethod.GET, RequestMethod.POST })
    public String do_increase(User user) {
        userServer.save(user);
        return "redirect:hobby";
    }

    //http://localhost:8080/SPA/user/do_upload
    @RequestMapping(value = "do_upload",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody //�ļ��ϴ�����
    public String do_upload(MultipartFile file, HttpServletRequest request) throws Exception{
        //�ļ���·��
        String url=request.getSession().getServletContext().getRealPath("/upload");
        if(!new File(url).exists()){
            new File(url).mkdir();
        }
        System.out.println(url);

        //�ļ���
        String fileName=UUID.randomUUID().toString().replaceAll("-","")+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),file.getOriginalFilename().length());
        System.out.println(fileName);
        FileUtils.copyInputStreamToFile(file.getInputStream(),new File(url+File.separator+fileName));

        return "{'url':'"+fileName+"'}";
    }


    //http://localhost:8080/SPA/user/download
    @GetMapping("download") //�ļ����ط���
    public ResponseEntity<byte[]> download(String filename, HttpServletRequest request) throws Exception{
        //�����ļ�·��
        String path = request.getServletContext().getRealPath("/download");
        File file = new File(path + File.separator + filename);

        HttpHeaders headers = new HttpHeaders();
        //������ʾ���ļ������������������������
        String downloadFielName = new String(filename.getBytes("UTF-8"),"iso-8859-1");

        //֪ͨ�������attachment�����ط�ʽ����ͼƬ
        headers.setContentDispositionFormData("attachment", downloadFielName);
        //application/octet-stream �� �����������ݣ�������ļ����أ���
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }
}
