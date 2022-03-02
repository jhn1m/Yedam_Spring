package co.micol.prj.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.micol.prj.notice.service.NoticeService;
import co.micol.prj.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeDao;

	@RequestMapping("/noticeList.do")
	public String noticeList(Model model) {
		model.addAttribute("notices", noticeDao.noticeSelectList());
		return "notice/noticeList";
	}

	@RequestMapping("/noticeInsertForm.do") // 단순 입력 폼 호출
	public String noticeInsertForm() {
		return "notice/noticeInsertForm";
	}

	@RequestMapping("/noticeInsert.do")
	public String noticeInsert(NoticeVO vo) {
		int n = noticeDao.noticeInsert(vo);
		if (n != 0) {
			return "redirect:noticeList.do";
		}
		return "notice/noticeError";
	}

	@PostMapping("/noticeSelect.do")
	public String noticeSelect(NoticeVO vo, Model model) {
		// model은 처리된 결과를 실어서 페이지로 보낸다
		vo = noticeDao.noticeSelect(vo);
		if (vo != null) {
			model.addAttribute("notice", vo);
			noticeDao.noticeHitUpdate(vo.getNoticeId());
			return "notice/noticeSelect";
		} else {
			model.addAttribute("message", "게시글이 존재하지 않습니다.");
			return "notice/noticeSelect";
		}
//		model.addAttribute("notice", noticeDao.noticeSelect(vo));
	}

}
