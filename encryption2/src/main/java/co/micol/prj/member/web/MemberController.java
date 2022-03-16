package co.micol.prj.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.micol.prj.comm.ShaEncrypt;
import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberDao;
	
	@RequestMapping("/memberLoginForm.do")
	public String memberLoginForm() {
		return "member/memberLoginForm";
	}
	
	@PostMapping("/memberLogin.do")
	public String memberLogin(MemberVO vo, Model model) {
		ShaEncrypt shaEncrypt = new ShaEncrypt();
		vo.setPassword(shaEncrypt.encryptSHA256(vo.getPassword())); // �н����� ��ȣȭ
		vo = memberDao.memberSelect(vo);
		if(vo != null) {
			model.addAttribute("message", vo.getName() + "�� ȯ���մϴ�.");
		}else {
			model.addAttribute("message", "���̵� �Ǵ� �н����尡 Ʋ���ϴ�.");
		}
		return "member/memberLogin";
	}
	
}
