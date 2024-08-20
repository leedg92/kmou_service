package rbs.modules.basket.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woowonsoft.egovframework.form.DTForm;
import com.woowonsoft.egovframework.form.DataMap;
import com.woowonsoft.egovframework.util.UserDetailsHelper;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import net.sf.json.JSONObject;
import rbs.egovframework.LoginVO;
import rbs.modules.basket.mapper.BasketMapper;
import rbs.modules.basket.mapper.BasketOraMapper;
import rbs.modules.basket.service.BasketService;


/**
 * 학업이수현황 serviceImple
 * @author 유경열
 */
@Service("basketService")
public class BasketServiceImpl extends EgovAbstractServiceImpl implements BasketService{

	@Resource(name="basketMapper")
	private BasketMapper basketDAO;
	
	@Resource(name="basketOraMapper")
	private BasketOraMapper basketOraDAO;
	
	@Override
	public List<Object> getSbjtBasket(Map<String, Object> param) {
		return basketDAO.getSbjtBasket(param);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Object> getBasketList(Map<String, Object> param) {
		List basketList = basketDAO.getMyBasketList(param);
		List<Map<String, Object>> result = null;
		List cartList = new ArrayList<Object>();
		if(basketList != null) {
			int basketListSize = basketList.size();
			for(int i = 0 ; i < basketListSize ; i ++) {
				
				Map<String, Object> basketParam = (Map<String, Object>)basketList.get(i);
			
				cartList.addAll(basketOraDAO.getMyBasketView(basketParam)); 
				
			}
		}
		return cartList;
	}
	
	/**
	 * 현재 학기 정보
	 * @param param
	 * @return
	 */
	@Override
	public DataMap getCurInfo() {
		return basketOraDAO.getCurInfo();
	}
	
	/**
	 * 장바구니 목록 총 수
	 * @param empNo
	 * @param param
	 * @return
	 */
    @Override
	public int getBasketCount(Map<String, Object> param) {
    	return basketDAO.getBasketCount(param);
    }

	@Override
	public int insertBsk(String memberId, String rawBody, String regiIp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		List<DTForm> dataList = new ArrayList<DTForm>();						// 저장항목
		
		LoginVO loginVO = (LoginVO) UserDetailsHelper.getAuthenticatedUser();
		String loginMemberId = null;
		
		if(loginVO != null) {
			loginMemberId = loginVO.getMemberId();
		}
		
		JSONObject reqJsonObj = JSONObject.fromObject(rawBody);
		String year = reqJsonObj.get("year").toString();
		String smt = reqJsonObj.get("smt").toString();
		String subjectCd = reqJsonObj.get("subjectCd").toString();
		String divcls = reqJsonObj.get("divcls").toString();
		String deptCd = reqJsonObj.get("deptCd").toString();
		String sbjt = reqJsonObj.get("sbjt").toString();
		String empNo = reqJsonObj.get("empNo").toString();
		
		dataList.add(new DTForm("STD_NO", memberId));
		dataList.add(new DTForm("YEAR", year));
		dataList.add(new DTForm("SMT", smt));
		dataList.add(new DTForm("SUBJECT_CD", subjectCd));
		dataList.add(new DTForm("DEPT_CD", deptCd));
		dataList.add(new DTForm("DIVCLS", divcls));
		dataList.add(new DTForm("EMP_NO", empNo));
		dataList.add(new DTForm("SBJT_NM_KOR", sbjt));
		
    	dataList.add(new DTForm("REGI_ID", loginMemberId));
    	dataList.add(new DTForm("REGI_IP", regiIp));
    	
    	param.put("dataList", dataList);
		
    	int result = basketDAO.insert(param);
    	
		return result;
	}

	@Override
	public int deleteBsk(String memberId, String rawBody) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		List<DTForm> searchList = new ArrayList<DTForm>();						// 검색항목
		
		JSONObject reqJsonObj = JSONObject.fromObject(rawBody);
		String year = reqJsonObj.get("year").toString();
		String smt = reqJsonObj.get("smt").toString();
		String subjectCd = reqJsonObj.get("subjectCd").toString();
		String divcls = reqJsonObj.get("divcls").toString();
		String deptCd = reqJsonObj.get("deptCd").toString();
		String empNo = reqJsonObj.get("empNo").toString();
		
		searchList.add(new DTForm("STD_NO", memberId));
		searchList.add(new DTForm("YEAR", year));
		searchList.add(new DTForm("SMT", smt));
		searchList.add(new DTForm("SUBJECT_CD", subjectCd));
		searchList.add(new DTForm("DEPT_CD", deptCd));
		searchList.add(new DTForm("DIVCLS", divcls));
		searchList.add(new DTForm("EMP_NO", empNo));
		
		param.put("searchList", searchList);
		
		int result = basketDAO.cdelete(param);
		
		return result;
	}

	@Override
	public int deleteAllBsk(String memberId) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		List<DTForm> searchList = new ArrayList<DTForm>();						// 검색항목
		
		searchList.add(new DTForm("STD_NO", memberId));
		
		param.put("searchList", searchList);
		
		int result = basketDAO.cdelete(param);
		
		return result;
	}

	@Override
	public int deleteSelectedBsk(String memberId, String rawBody) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		List<DTForm> searchList = new ArrayList<DTForm>();						// 검색항목
		int result = 0;
		
		JSONObject reqJsonObj = JSONObject.fromObject(rawBody);
		String[] deleteArray = reqJsonObj.get("deleteList").toString().split(",");
		
		for(int i = 0; i < deleteArray.length; i++) {
			String[] deleteInfo = deleteArray[i].split("-");
			String year = deleteInfo[0];
			String smt = deleteInfo[1];
			String subjectCd = deleteInfo[2];
			String deptCd = deleteInfo[3];
			String divcls = deleteInfo[4];
			String empNo = deleteInfo[5];
			
			searchList.add(new DTForm("STD_NO", memberId));
			searchList.add(new DTForm("YEAR", year));
			searchList.add(new DTForm("SMT", smt));
			searchList.add(new DTForm("SUBJECT_CD", subjectCd));
			searchList.add(new DTForm("DEPT_CD", deptCd));
			searchList.add(new DTForm("DIVCLS", divcls));
			searchList.add(new DTForm("EMP_NO", empNo));
			
			param.put("searchList", searchList);
			
			result += basketDAO.cdelete(param);
			
			searchList.clear();
		}
		
		return result;
	}

	@Override
	public List<Object> getPreApplSbjt(Map<String, Object> param) throws Exception {
		return basketOraDAO.getPreApplSbjt(param); 
	}

	@Override
	public DataMap sukangLogin(String memberId, String memberIp) throws Exception {
	       DataMap result = new DataMap();

//	       try {
	    	    // 1. 학생 기본 정보 조회
	    	    Map<String, Object> param = new HashMap<>();
	    	    param.put("STUDENT_NO", memberId);
	    	    Map<String, Object> studentInfo = basketOraDAO.getSukangStudentInfo(param);
	    	    if (studentInfo == null) {
	    	        result.put("err_code", "N");
	    	        result.put("err_message", "학번 입력이 잘못되었습니다.");
	    	        return result;
	    	    }

	    	    // 2. 학년도 및 학기 정보 조회
	    	    param.clear();
	    	    param.put("SINBUN_CODE", studentInfo.get("SINBUN_CODE"));
	    	    Map<String, Object> academicYear = basketOraDAO.getSukangAcademicYear(param);

	    	    // 3. 수강신청 기간 체크
	    	    param.clear();
	    	    param.put("SINBUN_CODE", studentInfo.get("SINBUN_CODE"));
	    	    param.put("YEAR", academicYear.get("YEAR"));
	    	    param.put("SMT", academicYear.get("SMT"));
	    	    String timeGb = basketOraDAO.getSukangRegistrationPeriod(param);
	    	    if ("SY020000".equals(timeGb)) {
	    	        result.put("err_code", "N");
	    	        result.put("err_message", "수강신청 기간이 아닙니다.");
	    	        return result;
	    	    }

	    	    // 4. 학생 상태 확인
	    	    param.clear();
	    	    param.put("STUDENT_NO", memberId);
	    	    param.put("YEAR", academicYear.get("YEAR"));
	    	    param.put("SMT", academicYear.get("SMT"));
	    	    Map<String, Object> studentStatus = basketOraDAO.getSukangStudentStatus(param);

	    	    // 5. 복학 상태 확인
	    	    Map<String, Object> returnStatus = basketOraDAO.getSukangReturnStatus(param);

	    	    // 6. 수강 가능 학점 계산
	    	    param.clear();
	    	    param.put("IS_PART_TIME", studentStatus.get("is_part_time"));
	    	    param.put("SMT", academicYear.get("SMT"));
	    	    param.put("YEAR", academicYear.get("YEAR"));
	    	    param.put("GRAD_CDT", studentInfo.get("GRAD_CDT"));
	    	    param.put("MAJOR_CD", studentInfo.get("MAJOR_CD"));
	    	    param.put("SINBUN_CODE", studentInfo.get("SINBUN_CODE"));
	    	    param.put("STUDENT_NO", memberId);
	    	    param.put("ENT_TP_CD", studentInfo.get("ENT_TP_CD"));
	    	    param.put("SMAJOR_CD", studentInfo.get("SMAJOR_CD"));
	    	    param.put("MINOR_CD", studentInfo.get("MINOR_CD"));
	    	    param.put("FUSE_CD", studentInfo.get("FUSE_CD"));
	    	    param.put("LINK_CD", studentInfo.get("LINK_CD"));
	    	    int maxCredits = basketOraDAO.getSukangMaxCredits(param);

	    	    // 7. 수강신청 내역 조회
//	    	    param.clear();
//	    	    param.put("YEAR", academicYear.get("YEAR"));
//	    	    param.put("SMT", academicYear.get("SMT"));
//	    	    param.put("STUDENT_NO", memberId);
//	    	    Map<String, Object> registeredCredits = basketOraDAO.getSukangRegisteredCredits(param);

	    	    // 8. 로그인 정보 기록
//	    	    param.clear();
//	    	    param.put("USERID", memberId);
//	    	    param.put("USER_IP", memberIp);
//	    	    param.put("LOGIN_GB", "WEB");
//	    	    param.put("JOB_PRG_ID", "SUKANG_LOGIN");
//	    	    basketOraDAO.insertSukangLoginInfo(param);

	    	    // 9. 멀티 로그온 방지를 위한 세션 정보 업데이트 - 멀티로그인 방지는 수강신청시스템에서의 멀티로그인 방지이기때문에 여기선 사용하지 않아도 될듯하다.
//	            String sessToken = generateSessionToken();
//	            param.put("sessToken", sessToken);
//	            param.put("tryCnt", "5");
//	            basketOraDAO.updateSukangSessionInfo(param);

	    	    // 10. 최종 결과 조합
	    	    result.put("err_code", "Y");
	    	    result.put("err_message", "OK");

	    	    // 학생 기본 정보에서 가져올 수 있는 값들 
	    	    result.put("vs_student_no", studentInfo.get("STUDENT_NO"));
	    	    result.put("vs_sinbun", studentInfo.get("SINBUN_CODE"));
	    	    result.put("vs_dept_cd", studentInfo.get("DEPT_CD"));
	    	    result.put("vs_major_cd", studentInfo.get("MAJOR_CD"));
	    	    result.put("vs_grade", studentInfo.get("CLASS_GRADE"));
	    	    result.put("vs_suc_grade", studentInfo.get("SUC_GRADE"));
	    	    result.put("vs_ent_year", studentInfo.get("ENT_YEAR"));
	    	    result.put("vs_pyn_yn", studentInfo.get("ENT_TP_CD").toString().startsWith("UD02") ? "Y" : "N");
	    	    result.put("vs_smajor_cd", studentInfo.get("SMAJOR_CD"));
	    	    result.put("vs_minor_cd", studentInfo.get("MINOR_CD"));
	    	    result.put("vs_fuse_cd", studentInfo.get("FUSE_CD"));
	    	    result.put("vs_link_cd", studentInfo.get("LINK_CD"));
	    	    // 학년도 및 학기 정보
	    	    result.put("vs_year", academicYear.get("YEAR"));
	    	    result.put("vs_smt", academicYear.get("SMT"));
	    	    // 수강신청 기간 구분
	    	    result.put("vs_time_gb", timeGb);
	    	    // 최대 수강 가능 학점
	    	    result.put("vi_max_cdt", maxCredits);
	    	    // 복학생 구분
	    	    result.put("vs_bokhak_yn", returnStatus.get("IS_RETURNING"));
	    	    // 기타 정보
	    	    result.put("vs_manager_yn", "N");  // 기본값 'N'으로 설정
	    	    result.put("vs_precourse", "Y");   // 기본값 'Y'로 설정
	    	    result.put("vs_pgm_gb", "WEB");    // 기본값 'WEB'으로 설정
	    	    result.put("vs_g_id", studentInfo.get("STUDENT_NO"));
//	    	    result.put("vs_sess_token", ??);  // 세션토큰
	    	    
	    	    // 수강신청 내역 (이미 포함되어 있을 수 있음)
//	    	    result.putAll(registeredCredits);

	    	    return result;

//	    	} catch (Exception e) {
//	    	    // 예외 처리 및 로깅
//	    	    result.put("err_code", "N");
//	    	    result.put("err_message", "처리 중 오류가 발생했습니다: " + e.getMessage());
//	    	    return result;
//	    	}
	}
}