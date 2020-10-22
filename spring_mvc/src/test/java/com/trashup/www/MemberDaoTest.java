package com.trashup.www;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.trashup.domain.Member;
import com.trashup.mapper.MemberDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MemberDaoTest {
	
	private static final Logger log = LoggerFactory.getLogger(MemberDaoTest.class);
		
	@Inject
	private MemberDao dao;
	
	
	
	@Test
	public void testTime() {
		log.info(dao.getTime());
	}		

	
	@Test 
	public void loginProc() {
		Member m = new Member();
		m.setId("admin");
		m.setPw("ehdaofu1");
		
		Member md = new Member();
		md = dao.loginProc(m);
		
		log.info(md.getId());
		log.info(md.getPw());
		log.info(md.getName());
		log.info(md.getNickname());
		log.info(md.getGrade());
		
		
		
	}
}
