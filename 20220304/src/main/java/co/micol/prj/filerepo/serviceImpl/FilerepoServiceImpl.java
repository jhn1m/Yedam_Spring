package co.micol.prj.filerepo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.micol.prj.filerepo.service.FilerepoMapper;
import co.micol.prj.filerepo.service.FilerepoService;
import co.micol.prj.filerepo.vo.FilerepoVO;

@Repository("fileDao") // 스프링 IOC에 등록해주세요.
public class FilerepoServiceImpl implements FilerepoService {

	@Autowired
	private FilerepoMapper map;
	
	@Override
	public List<FilerepoVO> filerepoSelectList() {
		return map.filerepoSelectList();
	}

	@Override
	public FilerepoVO filerepoSelect(FilerepoVO vo) {
		return map.filerepoSelect(vo);
	}

	@Override
	public int filerepoInsert(FilerepoVO vo) {
		return map.filerepoInsert(vo);
	}

	@Override
	public int filerepoUpdate(FilerepoVO vo) {
		return map.filerepoUpdate(vo);
	}

	@Override
	public int filerepoDelete(FilerepoVO vo) {
		return map.filerepoDelete(vo);
	}
}
