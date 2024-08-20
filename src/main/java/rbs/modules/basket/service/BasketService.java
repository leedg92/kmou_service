package rbs.modules.basket.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.woowonsoft.egovframework.form.DataMap;

/**
 * 학업이수현황 service
 * @author 유경열
 *
 */
public interface BasketService {
	
	/**
	 * 장바구니(교과목)
	 * @param request
	 * */
	List<Object> getSbjtBasket(Map<String, Object> param);
	
	/**
	 * 장바구니 목록
	 * @param request
	 * */
	List<Object> getBasketList(Map<String, Object> param);

	/**
	 * 현재 학기 정보
	 * @author 석수빈
	 * @return
	 */
	public DataMap getCurInfo() throws Exception;
	
	/**
	 * 장바구니 목록 총 수
	 * @param empNo, year
	 * @param param
	 * @return
	 */
	public int getBasketCount(Map<String, Object> param) throws Exception;
	
	/**
	 * 장바구니 등록
	 * insert
	 * */
	public int insertBsk(String memberId, String rawBody, String regiIp) throws Exception;  
	
	/**
	 * 장바구니 삭제
	 * delete
	 * */
	public int deleteBsk(String memberId, String rawBody) throws Exception;
	
	/**
	 * 장바구니 삭제
	 * delete
	 * */
	public int deleteSelectedBsk(String memberId, String rawBody) throws Exception;
	
	/**
	 * 장바구니 전체 삭제
	 * delete
	 * */
	public int deleteAllBsk(String memberId) throws Exception;

	/**
	 * 에비수강신청 현황 가져오기
	 * @param STUDENT_NO
	 * */
	public List<Object> getPreApplSbjt(Map<String, Object> param) throws Exception;

	/**
	 * 예비수강신청 login(기존의 프로시저를 쿼리 연속실행으로 대체하여 사용)
	 * @param memberIp 
	 * @param STUDENT_NO
	 * */
	public DataMap sukangLogin(String memberId, String memberIp) throws Exception;
	
}