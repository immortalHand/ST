package st.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import st.mapper.ActiveMapper;
import st.pojo.Active;
import st.pojo.ActiveExample;
import st.pojo.ActiveExample.Criteria;
import st.service.ActiveService;

@Service
public class ActiveServiceImpl implements ActiveService{

	@Resource
	private ActiveMapper activeMapper;

	@Override
	public List<Active> showActive() {
		return activeMapper.showActive();
	}

	@Override
	public List<Active> showAll() {
		return activeMapper.selectByExample(new ActiveExample());
	}

	@Override
	public Active selectActiveById(int id) {
		return activeMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Active> selectActivesByOrgaId(int id) {
		ActiveExample example = new ActiveExample();
		Criteria criteria = example.createCriteria();
		criteria.andOrganizationidEqualTo(id);
		return activeMapper.selectByExample(example );
	}

	@Override
	public List<Active> selectAll() {
		return activeMapper.selectAll();
	}

	@Override
	public int delactive(int id) {
		return activeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int addactive(Active active) {
		return activeMapper.insert(active);
	}
	
}
