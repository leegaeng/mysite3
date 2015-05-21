package com.sds.icto.mysite.repository;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.sds.icto.mysite.domain.MemberVo;

@Repository
public class MemberDao {

	@Autowired
	SqlMapClientTemplate st;

	public void insert(MemberVo m) {
		st.insert("member.insert", m);
	}

	public void update(MemberVo m) {
		st.update("member.update", m);
	}

	public MemberVo getMember(MemberVo vo) {
		MemberVo m = (MemberVo) st.queryForObject("member.get", vo);
		return m;
	}
}
