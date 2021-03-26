package post;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import myb.SqlCon;

public class PostDAO {
	SqlSessionFactory factory = SqlCon.getSqlSession();
	
	static PostDAO dao = new PostDAO();
	public static PostDAO instance() {
		return dao;
	}

	public List<PostDTO> selAll(int startrow) {
		SqlSession sql = factory.openSession();
		List<PostDTO> list = sql.selectList("selAll", startrow);
		sql.close();
		
		return list;
	}
	
	public PostDTO select(int postNum) {
		SqlSession sql = factory.openSession();
		PostDTO post = sql.selectOne("select", postNum);
		sql.close();
		
		return post;
	}
	
	public List<PostDTO> select10(String id) {
		SqlSession sql = factory.openSession();
		List<PostDTO> list = sql.selectList("userPost", id);
		sql.close();
		
		return list;
	}
	
	public void delete(int postNum) {
		SqlSession sql = factory.openSession();
		sql.delete("delete", postNum);
		sql.commit();
		sql.close();
	}
	
	public void insert(PostDTO post) {
		SqlSession sql = factory.openSession();
		sql.delete("insert", post);
		sql.commit();
		sql.close();
	}
	
	public void update(PostDTO post) {
		SqlSession sql = factory.openSession();
		sql.update("update", post);
		sql.commit();
		sql.close();
	}

	public int getListCount() {
		int cnt = 0;
		
		SqlSession sql = factory.openSession();
		cnt = sql.selectOne("count");
		sql.close();
		
		return cnt;
	}
}
