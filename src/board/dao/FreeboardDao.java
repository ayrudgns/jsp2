package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import board.vo.Freeboard;
import mybatis.SqlSessionBean;

public class FreeboardDao {

	private static FreeboardDao dao = new FreeboardDao();

	private FreeboardDao() {
		
	}
	
	public static FreeboardDao getInstance() {
		return dao;
	}

	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	
	// 메소드 1)
	public int getCount() {
		SqlSession mapper = factory.openSession();
		int count = mapper.selectOne("getCount");
		mapper.close();
		return count;
	}
	
	// 메소드 2)
	public List<Freeboard> getPageList(Map<String, Integer> map) {
		SqlSession mapper = factory.openSession();
		List<Freeboard> list = mapper.selectList("getPageList", map);
		mapper.close();
		return list;
	}
	
	// 메소드 3)
	public int insert(Freeboard vo) {
		SqlSession mapper = factory.openSession();
		int result = mapper.insert("insert", vo);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	// 메소드 4)
	public Freeboard getDetail(int idx) {
		SqlSession mapper = factory.openSession();
		Freeboard vo = mapper.selectOne("freeboard.detail", idx);
		mapper.close();
		return vo;
	}
	
	// 메소드 5)
	public void readcountUp(int idx) {
		SqlSession mapper = factory.openSession();
		mapper.update("readcountUp", idx);
		mapper.commit();
		mapper.close();
	}
	
	// 메소드 6)
	public int delete(Map<String, Object> map) {
		SqlSession mapper = factory.openSession();
		int result = mapper.delete("freeboard.delete", map);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	// 메소드 7)
	public void update(Freeboard vo) {
		SqlSession mapper = factory.openSession();
		mapper.update("freeboard.update", vo);
		mapper.commit();
		mapper.close();
	}
}
