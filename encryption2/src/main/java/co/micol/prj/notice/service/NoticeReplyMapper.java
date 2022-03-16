package co.micol.prj.notice.service;

import java.util.List;

import co.micol.prj.notice.vo.NoticeReplyVO;

public interface NoticeReplyMapper {
	List<NoticeReplyVO> noticeReplySelect(NoticeReplyVO vo); // ��� ��������
	int noticeReplyInsert(NoticeReplyVO vo); // ��� �ޱ�
	int noticeReplyDelete(NoticeReplyVO vo); // ��� ����
	NoticeReplyVO selectReplyNo();
}
