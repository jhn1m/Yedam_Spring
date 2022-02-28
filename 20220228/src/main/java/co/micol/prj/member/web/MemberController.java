package co.micol.prj.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.service.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberDao;

//  Autowired 여러개 쓰고 싶을 때
//	@Autowired
//	private Mem map;

	// 멤버 전체리스트 불러오기
	@RequestMapping("/memberList.do") 
	public String memberList(Model model) {
		model.addAttribute("members", memberDao.memberSelectList());
		return "member/memberList";
	}
	
	@PostMapping("/memberSelect.do")
	public String memberSelect(MemberVO vo, Model model) {
		model.addAttribute("member", memberDao.memberSelect(vo));
		return "member/memberSelect";
	}
	
}
