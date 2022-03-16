package co.micol.prj.notice.service;

import java.util.List;

import co.micol.prj.notice.vo.NoticeReplyVO;

public interface NoticeReplyMapper {
	List<NoticeReplyVO> noticeReplySelect(NoticeReplyVO vo); // ´ñ±Û °¡Á®¿À±â
	int noticeReplyInsert(NoticeReplyVO vo); // ´ñ±Û ´Þ±â
	int noticeReplyDelete(NoticeReplyVO vo); // ´ñ±Û »èÁ¦
	NoticeReplyVO selectReplyNo();
}
