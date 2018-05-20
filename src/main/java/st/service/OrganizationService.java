package st.service;

import java.util.List;

import st.pojo.Active;
import st.pojo.Organization;
import st.pojo.User;

public interface OrganizationService {

	/**
	 * 主页显示前5社团
	 * @return
	 */
	public List<Organization> showOrganizations();

	/**
	 * 显示所有社团
	 * @return
	 */
	public List<Organization> showAll();

	/**
	 * 根据社团id查询社团信息
	 * @param id
	 * @return
	 */
	public Organization sheTuanInfolById(Integer id);


	List<Organization> showAllOrganization(Integer pageIndex, Integer pageCount);

	public int addOrga(Organization org);

	public int updateOrga(Organization org);

	public int delshetuan(int id);

}
