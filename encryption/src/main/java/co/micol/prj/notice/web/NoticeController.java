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
	
	@PostMapping("/noticeSelect.do")
	public String noticeSelect(NoticeVO vo, Model model) {
		model.addAttribute("notice", noticeDao.noticeSelect(vo));
		return "notice/noticeSelect";
	}
	
}
