package online.qsx.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = {"classpath:applicationContext-mybatis.xml"})
public class MyBatisTest {

//    @Autowired
//    private MyselfMapper myselfMapper;
//
////    @Test
////    public void findALL(){
////        PageHelper.startPage(1,3);
////        UserCriteria userCriteria=new UserCriteria();
////        List<User>users=userMapper.selectByExample(userCriteria);
////        PageInfo<User>pageInfo=new PageInfo<>(users);
////        for (User user:pageInfo.getList()) {
////            System.out.println(user);
////        }
////        users.stream().forEach(user -> System.out.println(user));
////    }


}
