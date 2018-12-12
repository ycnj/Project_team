package com.team.spring.mybartis;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.team.spring.apple.EmpVO;

public class EmpManager {
	private static SqlSessionFactory sqlMapper;
    static{
        try {
            Reader reader = Resources.getResourceAsReader("mybatis/sqlmapConfig.xml");

            sqlMapper = new SqlSessionFactoryBuilder().build(reader); 
        } catch (IOException err){
            throw new RuntimeException("SQL세션팩토리 인스턴스 생성 실패" + err,err);
        }
    }
    public static List<EmpVO> boardList(String keyfield, String keyword){
        List<EmpVO> list = null;
        SqlSession session = sqlMapper.openSession();
        if(keyfield != null && keyword != null && keyfield !="" && keyword !=""){
            Map<String, String> map = new HashMap<String, String> ();
            map.put("keyfield" , keyfield);
            map.put("keyword", keyword);
            list = session.selectList("empSearch", map);
            session.close();
            return list;
        }else {
            list = session.selectList("empList");
            session.close();
            return list;
        }
    }

}
