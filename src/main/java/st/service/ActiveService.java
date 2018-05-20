package st.service;

import java.util.List;

import st.pojo.Active;

public interface ActiveService {

	/**
	 * 主页显示社团活动前5个
	 * @return
	 */
	public List<Active> showActive();

	/**
	 * 显示所有社团活动
	 * @return
	 */
	public List<Active> showAll();

	/**
	 * 通过id查询active
	 * @param id
	 * @return
	 */
	public Active selectActiveById(int id);

	/**
	 * 通过社团id查询所有社团下的活动
	 * @param id
	 * @return
	 */
	public List<Active> selectActivesByOrgaId(int id);

	public List<Active> selectAll();

	public int delactive(int id);

	public int addactive(Active active);
}
