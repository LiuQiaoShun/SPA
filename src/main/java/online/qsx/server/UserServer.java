package online.qsx.server;


import com.github.pagehelper.PageInfo;
import online.qsx.model.User;

import java.util.List;

public interface UserServer {
    PageInfo<User> findAllUser(User user,int pageNum);

    User findUserById(User user);

    int edit(User user);

    int remove(User user);

    int save(User user);

    boolean login(String username,String password);

    void deleteArrayUserId(int[] id);

    void delUserById(int id);

}
