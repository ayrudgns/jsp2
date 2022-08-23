package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import board.vo.Gallery;
import mybatis.SqlSessionBean;

public class GalleryDao {

	private static GalleryDao dao = new GalleryDao();
	
	private GalleryDao() {
		
	}
	
	public static GalleryDao getInstance() {
		return dao;
	}
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	
	// 메소드 1)
	public int insert(Gallery vo) {
		SqlSession mapper = factory.openSession();
		int result = mapper.insert("gallery.insert", vo);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	
	// 메소드 2)
	public List<Gallery> selectAll() {
		SqlSession mapper = factory.openSession();
		List<Gallery> list = mapper.selectList("gallery.selectAll");
		mapper.close();
		return list;
	}
	
	// 메소드 3)
	public Gallery selectOne(int idx) {
		SqlSession mapper = factory.openSession();		
		Gallery vo = mapper.selectOne("gallery.selectOne", idx);
		mapper.close();
		return vo;
	}

}
