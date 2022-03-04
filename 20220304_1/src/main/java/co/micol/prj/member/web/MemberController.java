package co.micol.prj.member.web;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.vo.MemberVO;

@Controller
public class MemberController {

		@Autowired
		private MemberService memberDao;
		
		@Autowired
		private String upLoadPath;
		
		@RequestMapping("/memberList.do")
		public String memberList(Model model) {
			model.addAttribute("members", memberDao.memberSelectList());
			return "member/memberList";
		}

		@RequestMapping("/memberInsertForm.do")
		public String memberInsertForm() {
			return "member/memberInsertForm";
		}

		@RequestMapping("/memberInsert.do")
		public String memberInsert(MemberVO vo, MultipartFile file) {
			String fileName = file.getOriginalFilename();
			String id = UUID.randomUUID().toString();
			String targetFile = id + fileName.substring(fileName.lastIndexOf("."));
			File target = new File(upLoadPath, targetFile);
			try {
				FileCopyUtils.copy(file.getBytes(), target);
				targetFile = upLoadPath + File.separator + targetFile; // 실제경로를 포함
				vo.setPicture(fileName); // 원본 파일명을 삽입
				vo.setRpicture(targetFile); // 변경된 파일명을 삽입
				int n = memberDao.memberInsert(vo);
				if (n != 0) {
					return "redirect:memberList.do";
				}
				// DB작업
			}catch(Exception e) {
				e.printStackTrace();
			}
			return "member/memberError";
		}

		@RequestMapping("/memberSelect.do")
		public String memberSelect(MemberVO vo, Model model) {
			vo = memberDao.memberSelect(vo);
			if (vo != null) {
				model.addAttribute("member", vo);
				return "member/memberSelect";
			} else {
				model.addAttribute("message", "없는 회원입니다.");
				return "member/memberSelect";
			}
		}

		@RequestMapping("/memberUpdate.do")
		public String memberUpdate(MemberVO vo) {
			int n = memberDao.memberUpdate(vo);
			if (n != 0) {
				return "redirect:memberList.do";
			}
			return "member/memberError";
		}

		@RequestMapping("/memberDelete.do")
		public String memberDelete(MemberVO vo) {
			int n = memberDao.memberDelete(vo);
			if (n != 0) {
				return "redirect:memberList.do";
			}
			return "member/memberError";
		}

		@RequestMapping("/memberLogout.do")
		public String memberLogout(HttpSession session) {
			session.invalidate();
			return "redirect:home.do";
		}
		
		@RequestMapping("/memberLoginForm.do")
		public String memberLoginForm(Model model, MemberVO vo) {
			return "member/memberLoginForm";
		}

		@PostMapping("/memberLogin.do")
		public ModelAndView memberLogin(MemberVO vo, ModelAndView mv, HttpSession session) {
			vo = memberDao.memberSelect(vo);
			if (vo != null) {
				session.setAttribute("sessionId", vo.getId());
				mv.addObject("message", vo.getName() + "님 환영합니다.");
				mv.setViewName("member/memberLoginSuccess");
			} else {
				mv.addObject("message", "아이디 또는 패스워드가 잘못되었습니다.");
				mv.setViewName("member/memberError");
			}
			return mv;
		}

		@RequestMapping("/myIdCheckForm.do")
		public String myIdCheckForm() {
			return "member/myIdCheckForm";
		}
		
		@RequestMapping("/myIdCheck.do")
		public ModelAndView myIdCheck(ModelAndView mv, MemberVO vo) {
			vo = memberDao.myIdCheck(vo.getId());
			if(vo != null) {
				mv.addObject("id", vo.getId());
				mv.setViewName("member/myIdCheck");
			}else {
				mv.setViewName("member/memberError");
			}
			return mv;
		}
}
