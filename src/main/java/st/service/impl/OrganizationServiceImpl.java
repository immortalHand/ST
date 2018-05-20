package st.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import st.mapper.OrganizationMapper;
import st.pojo.Organization;
import st.pojo.OrganizationExample;
import st.service.OrganizationService;

@Service
public class OrganizationServiceImpl implements OrganizationService{

	@Resource
	private OrganizationMapper organizationMapper;
	@Override
	public List<Organization> showOrganizations() {
		return organizationMapper.showOrganizations();
	}
	
	
	@Override
	public List<Organization> showAll() {
		return organizationMapper.selectByExample(new OrganizationExample());
	}


	@Override
	public Organization sheTuanInfolById(Integer id) {
		return organizationMapper.selectByPrimaryKey(id);
	}


	@Override
	public List<Organization> showAllOrganization(Integer pageIndex, Integer pageCount) {
		PageHelper.startPage(pageIndex, pageCount);
		return organizationMapper.showAllOrganization();
	}


	@Override
	public int addOrga(Organization org) {
		return organizationMapper.insert(org);
	}


	@Override
	public int updateOrga(Organization org) {
		Organization orgz = organizationMapper.selectByPrimaryKey(org.getId());
		orgz.setInfo(org.getInfo());
		orgz.setName(org.getName());
		orgz.setNum(org.getNum());
		orgz.setTime(org.getTime());
		return organizationMapper.updateByPrimaryKey(orgz);
	}


	@Override
	public int delshetuan(int id) {
		return organizationMapper.deleteByPrimaryKey(id);
	}

}
