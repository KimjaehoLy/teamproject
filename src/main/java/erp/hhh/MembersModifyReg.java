package erp.hhh;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import erp.Action;

@Service("membersmodifyReg")
public class MembersModifyReg implements Action{
	
	@Resource
	UserMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest request) {
		System.out.println("수정하러 들어왔습니다.");
		
		//파라미터로 사원 정보 받음
		UserVO param_vo = (UserVO)map.get("user");
		
		
		//수정하는 sql문
		Integer chk = mapper.user_modify(param_vo);
		System.out.println("수정됬나 확인 : " + chk);
		
		
		System.out.println("검사합니다파일 : " + param_vo.user_file);
		System.out.println("검사합니다급여 : " + param_vo.user_pay);
		
		//수정폼에서 사용자가 파일을 올린다면 파일 수정(삭제하고 다시올린파일 다운로드)
		if(param_vo.getUser_file() != null && !param_vo.getUser_file().equals("")) {
			//파일 이름 찾기
			String deleteFile = mapper.user_detail(param_vo.getUser_id()).getUser_file();
			
			//기존 파일 삭제후 다운로드
			fileModify(request, param_vo, chk, deleteFile);
		}
		
		//리다이렉트할 path데이터 담음
		request.setAttribute("redirect", "members/detail?user_id=" + param_vo.getUser_id());
		
		return null;
	}
	
	
	public void fileModify(HttpServletRequest request, UserVO vo, int chk, String deleteFile) {
		
		System.out.println("파일다운로드");
		String path = request.getRealPath("/up"); // 배포한다고 하면 이거 써야댐
		path = "C:\\김재호\\Java공부자료\\워크스페이스\\sts_mvc_work\\erpTeam\\src\\main\\resources\\static\\userFile";
		
		if(chk == 1) {
			new File(path + "\\" + deleteFile).delete();
			new HyunSuShow().fileUpload(vo.getUser_upfile(), request);
		}
		
		
	}
	
	

}
