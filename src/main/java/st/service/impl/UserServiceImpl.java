package st.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;





import st.mapper.UserMapper;
import st.pojo.User;
import st.pojo.UserExample;
import st.pojo.UserExample.Criteria;
import st.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	@Qualifier("userMapper")
	private UserMapper userMapper;
	
	@Override
	public User login(User user) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andStunoEqualTo(user.getStuno());
		criteria.andPasswordEqualTo(user.getPassword());
		List<User> list = userMapper.selectByExample(example);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	@Override
	public List<User> showUser() {
		return userMapper.showUser();
	}

	@Override
	public List<User> showAll() {
		return userMapper.selectAll();
	}

	@Override
	public int addUser(User user) {
		return userMapper.insert(user);
	}

	@Override
	public boolean selectStuno(int stuno) {
		UserExample example = new UserExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andStunoEqualTo(stuno);
		List<User> list = userMapper.selectByExample(example );
		if(list.size() > 0){
			return true;
		}
		return false;
	}

	@Override
	public List<User> selectSheZByTuanId(Integer id) {
		UserExample example = new UserExample();
		Criteria create = example.createCriteria();
		create.andOrganizationidEqualTo(id);
		create.andTypeEqualTo(2);
		List<User> list = userMapper.selectByExample(example );
		return list;
	}

	@Override
	public User selectActiveByUid(int uid) {
		return userMapper.selectById(uid);
	}

	@Override
	public int updateUser(User user) {
		return userMapper.updateByPrimaryKey(user);
	}

	@Override
	public int deluser(int id) {
		return userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public User selectById(int id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<User> showAllBy3() {
		return userMapper.showAllBy3();
	}

	@Override
	public List<User> selectAll() {
		return userMapper.selectAlls();
	}

	@Override
	public List<User> selectAllno() {
		UserExample example = new UserExample();
		example.setOrderByClause("id desc");
		Criteria criteria = example.createCriteria();
		criteria.andOrganizationidEqualTo(0);
		return userMapper.selectByExample(example );
	}
	
	

}
