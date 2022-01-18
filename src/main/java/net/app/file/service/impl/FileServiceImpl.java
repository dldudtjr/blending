package net.app.file.service.impl;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import net.app.file.service.FileService;
import net.app.file.vo.FileVO;

@Service("fileService")
public class FileServiceImpl extends EgovAbstractServiceImpl implements FileService {

	@Resource(name = "fileDAO")
	private FileDAO fileDAO;

	@Override
	public List<FileVO> getFileLst(FileVO fileVO) {
		return this.fileDAO.getFileLst(fileVO);
	}

	@Override
	public int delFileDo(FileVO fileVO) {
		List<FileVO>  list = this.fileDAO.getFileLst(fileVO);
		int i = 0;
		for(FileVO vo : list){
			String s = vo.getSaveFilePath()+"/"+vo.getRealFileNm();
			File f = new File(s);
		    if (f.delete()) {
		    	i++;
		    }
		    this.fileDAO.delFileDo(vo);
		}
		return i;
	}


	@Override
	public String insFileDo(FileVO fileVO) {
		String i = this.fileDAO.insFileDo(fileVO);
		return i;
	}

	@Override
	public void insFileDo(List<FileVO> list,String parntsDtaId) {
		for (FileVO fileLst : list) {
		    if(!"noFile".equals(fileLst.getUploadFileNm())) {
		        fileLst.setParntsDtaId(parntsDtaId);
		        this.fileDAO.insFileDo(fileLst);
		    }
		}
	}

    @Override
    public void insFileDoAlone(FileVO fileVO, String parntsDtaId) {
            fileVO.setParntsDtaId(parntsDtaId);
            if(!"".equals(fileVO.getFileId()) && fileVO.getFileId() != null ) {
                this.delFileDo(fileVO);
            }
            this.fileDAO.insFileDo(fileVO);
    }
}
