package co.micol.prj.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberDao;
	
	@RequestMapping("/memberList.do")
	public String memberList(Model model) {
		model.addAttribute("members", memberDao.memberSelectList());
		return "member/memberList";
	}
	
	@PostMapping("/memberSelect.do")
	public String memberSelect(Model model, MemberVO vo) {
		vo = memberDao.memberSelect(vo);
		if(vo!=null) {
			model.addAttribute("member", vo);
			return "member/memberSelect";
		} else {
			model.addAttribute("message", "조회된 회원이 없습니다.");
			return "member/memberError";
		}
	}
	
	@RequestMapping("/memberInsertForm.do")
	public String memberInsertForm() {
		return "member/memberInsertForm";
	}
	
	@PostMapping("/memberInsert.do")
	public String memberInsert(MemberVO vo) {
		int n = memberDao.memberInsert(vo);
		if(n!=0) {
			return "redirect:memberList.do";
		}
		return "member/memberError";
	}
	
	@RequestMapping("/memberUpdateForm.do")
	public String memberUpdateForm(Model model, MemberVO vo) {
		model.addAttribute("member", memberDao.memberSelect(vo));
		return "member/memberUpdateForm";
	}
	
	@PostMapping("/memberUpdate.do")
	public String memberUpdate(MemberVO vo) {
		int n = memberDao.memberUpdate(vo);
		if(n != 0) {
			return "redirect:memberList.do";
		}
		return "member/memberError";
	}
	
	@RequestMapping("/memberDelete.do")
	public String memberDelete(MemberVO vo) {
		memberDao.memberDelete(vo);
		return "redirect:memberList.do";
	}
	
	@RequestMapping("/memberLoginForm.do")
	public String memberLoginForm(Model model, MemberVO vo) {
		return "member/memberLoginForm";
	}
	
	@PostMapping("/memberLogin.do")
	public String memberLogin(MemberVO vo, HttpServletRequest request) {
		int n = memberDao.memberLogin(vo.getId());
		HttpSession session = request.getSession();
		if(n==0) {
			session.setAttribute("sessionId", vo.getId());
			return "member/memberLoginSuccess";
		}
		
		return "member/memberError";
	}
	
	@RequestMapping("/memberLogout.do")
	public String memberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:home.do";
	}
	
	@RequestMapping("/myIdCheckForm.do")
	public String myIdCheckForm() {
		return "member/myIdCheckForm";
	}
	
	@RequestMapping("/myIdCheck.do")
	public String myIdCheck(Model model, MemberVO vo) {
		vo = memberDao.myIdCheck(vo);
		if(vo!=null) {
			model.addAttribute("member", vo);
			return "member/myIdCheck";
		}
		return "member/memberError";
	}
}
