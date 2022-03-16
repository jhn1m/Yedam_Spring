package co.micol.prj.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.micol.prj.notice.service.NoticeReplyService;
import co.micol.prj.notice.service.NoticeService;
import co.micol.prj.notice.vo.NoticeReplyVO;
import co.micol.prj.notice.vo.NoticeVO;

@Controller // �Ϲ� ��Ʈ�ѷ��� ���ϰ��� ���� �������� �޶�����.
public class NoticeController {
	
	@Autowired
	private NoticeService noticeDao;
	
	@Autowired
	private NoticeReplyService replyDao;
	
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model) {
		model.addAttribute("notices", noticeDao.noticeSelectList());
		return "notice/noticeList";
	}
	
	@PostMapping("/noticeSelect.do")
	public String noticeSelect(NoticeVO vo, NoticeReplyVO rvo, Model model) {
		rvo.setNotice_id(vo.getNoticeId()); // ����� ã������
		model.addAttribute("notice", noticeDao.noticeSelect(vo));
		model.addAttribute("replys", replyDao.noticeReplySelect(rvo)); // ��۰�������
		return "notice/noticeSelect";
	}
	
	@PostMapping("/ajaxReplyDelete.do")
	@ResponseBody // ȣ���� ������ �����ִ� ���� == @RestController
	public String ajaxReplyDelete(NoticeReplyVO vo) {
		int n = replyDao.noticeReplyDelete(vo);
		if(n != 0) {
			return "success";
		}else {
			return null;
		}
	}
}