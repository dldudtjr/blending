package net.app.file.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egov.cmm.service.impl.EgovComAbstractDAO;
import net.app.file.vo.FileVO;

@Repository("fileDAO")
public class FileDAO extends EgovComAbstractDAO {

    public List<FileVO> getFileLst(FileVO fileVO) {
        return selectList("fileDAO.getFileLst", fileVO);
    }

    public String insFileDo(FileVO fileVO) {
        return insert("fileDAO.insFileDo", fileVO) + "";
    }

    public String delFileDo(FileVO fileVO) {
        return update("fileDAO.delFileDo", fileVO) + "";
    }

}