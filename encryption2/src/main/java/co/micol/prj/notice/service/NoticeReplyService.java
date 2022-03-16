package co.micol.prj.notice.service;

import java.util.List;

import co.micol.prj.notice.vo.NoticeReplyVO;

public interface NoticeReplyService {
	List<NoticeReplyVO> noticeReplySelect(NoticeReplyVO vo); // ��� ��������
	int noticeReplyInsert(NoticeReplyVO vo); // ��� �ޱ�
	int noticeReplyDelete(NoticeReplyVO vo); // ��� ����
	NoticeReplyVO selectReplyNo();
}
