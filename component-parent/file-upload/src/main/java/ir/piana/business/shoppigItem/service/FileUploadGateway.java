package ir.piana.business.shoppigItem.service;

import ir.piana.dev.springvue.core.action.Action;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Iterator;
import java.util.List;

@Service("FileUploadGateway")
public class FileUploadGateway extends Action {
    private static Logger logger = LoggerFactory.getLogger(FileUploadGateway.class);

    @Value("${spring-vue.file-upload.directory}")
    private String UPLOAD_DIRECTORY;// = "upload";
    @Value("${spring-vue.file-upload.threshold-size}")
    private int THRESHOLD_SIZE;//     = 1024 * 1024 * 3;  // 3MB
    @Value("${spring-vue.file-upload.max-file-size}")
    private int MAX_FILE_SIZE;//      = 1024 * 1024 * 40; // 40MB
    @Value("${spring-vue.file-upload.max-request-size}")
    private int MAX_REQUEST_SIZE;//   = 1024 * 1024 * 50; // 50MB

    public String getFile(HttpServletRequest r, String path) {

        if (!ServletFileUpload.isMultipartContent(r)) {
            logger.error("content is not multipart!");
            return null;
        }

        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(THRESHOLD_SIZE);
        factory.setRepository(new File(path));
//        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // constructs the directory path to store upload file
        String uploadPath = r.getContextPath()
                + File.separator + UPLOAD_DIRECTORY;
        //  creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        List formItems = null;
        try {
            formItems = upload.parseRequest(r);
            Iterator iter = formItems.iterator();
            // iterates over form's fields
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                // processes only fields that are not form fields
                String filePath = null;
                if (!item.isFormField()) {
                    String fileName = RandomStringUtils.random(64, true, true);
//                    String fileName = new File(item.getName()).getName();
                    filePath = uploadPath + File.separator + fileName;
                    File storeFile = new File(filePath);

                    // saves the file on disk
                    item.write(storeFile);
                }
                return filePath;
            }
        } catch (FileUploadException e) {
            logger.error(e.getMessage());
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return null;
    };
}
