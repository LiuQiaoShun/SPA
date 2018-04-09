package online.qsx.server.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import online.qsx.mapper.UserMapper;
import online.qsx.model.User;
import online.qsx.model.UserCriteria;
import online.qsx.server.UserServer;
import online.qsx.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServerImpl implements UserServer {

    @Autowired
    private UserMapper userMapper;

    @Override
    public PageInfo<User> findAllUser(User user, int pageNum) {
        UserCriteria userCriteria=new UserCriteria();
        if (user!=null){
            UserCriteria.Criteria criteria=userCriteria.createCriteria();
            if(user.getUsername()!=null&&user.getUsername().trim().length()>0){
                criteria.andUsernameLike("%"+user.getUsername().trim()+"%");
            }
        }
        PageHelper.startPage(pageNum, PageUtil.PAGE_SIZE);
        List<User>users=userMapper.selectByExample(userCriteria);
        PageInfo<User>pageInfo=new PageInfo<User>(users);
        return pageInfo;
    }


    @Override
    public User findUserById(User user) {
        return userMapper.selectByPrimaryKey(user.getId());
    }



    @Override
    public int edit(User user) {
        UserCriteria userCriteria=new UserCriteria();
        userCriteria.createCriteria().andIdEqualTo(user.getId());
        return userMapper.updateByExampleSelective(user,userCriteria);
    }

    @Override
    public int save(User user) {
        return userMapper.insert(user);
    }

    @Override
    public int remove(User user) {
        return userMapper.deleteByPrimaryKey(user.getId());
    }

    @Override
    public void deleteArrayUserId(int[] id) {
        userMapper.batchDeleteUser(id);
    }

    @Override
    public void delUserById(int id) {
        userMapper.deleteByPrimaryKey(id);
    }

    User users[]=new User[10];
    public UserServerImpl(){
        User admin=new User("admin","admin123456");
        User user=new User("user","user123456");
        User jack=new User("student","student123");
        User lucy=new User("teacher","teacher123");

        users[0]=admin;
        users[1]=user;
        users[2]=jack;
        users[3]=lucy;
    }
    @Override
    public boolean login(String username,String password){
        for (User user:users) {
            if (user==null){
                continue;
            }
            if(user.getUsername().equals(username)&&user.getPassword().equals(password)){
                return true;
            }
        }

        return false;
    }
}
