package st.service;

import java.util.List;

import st.pojo.User;


public interface UserService {
	/**
	 * 登录
	 * @param user
	 * @return
	 */
	public User login(User user);

	/**
	 * 主页显示社团人员信息
	 * @return
	 */
	public List<User> showUser();

	/**
	 * 显示所有社团人员信息
	 * @return
	 */
	public List<User> showAll();

	/**
	 * 注册添加用户
	 * @param user
	 * @return
	 */
	public int addUser(User user);
	/**
	 * 查询学号是否重复
	 * @return
	 */
	public boolean selectStuno(int stuno);

	/**
	 * 根据社团id查询所有此社团长
	 * @param id
	 * @return
	 */
	public List<User> selectSheZByTuanId(Integer id);

	/**
	 * 根据id查找此人
	 * @param uid
	 * @return
	 */
	public User selectActiveByUid(int uid);

	/**
	 * 通过传递对象修改用户信息
	 * @param user
	 * @return
	 */
	public int updateUser(User user);

	public int deluser(int id);

	public User selectById(int id);

	public List<User> showAllBy3();

	public List<User> selectAll();

	public List<User> selectAllno();
}
