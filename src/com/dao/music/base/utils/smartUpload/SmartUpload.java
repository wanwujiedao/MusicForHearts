//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.dao.music.base.utils.smartUpload;

import com.dao.music.base.utils.smartUpload.SmartFile;
import com.dao.music.base.utils.smartUpload.SmartFiles;
import com.dao.music.base.utils.smartUpload.SmartRequest;
import com.dao.music.base.utils.smartUpload.SmartUploadException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

public class SmartUpload {
    protected byte[] m_binArray;
    protected HttpServletRequest m_request;
    protected HttpServletResponse m_response;
    protected ServletContext m_application;
    private int m_totalBytes = 0;
    private int m_currentIndex = 0;
    private int m_startData = 0;
    private int m_endData = 0;
    private String m_boundary = "";
    private long m_totalMaxFileSize = 0L;
    private long m_maxFileSize = 0L;
    private Vector m_deniedFilesList = new Vector();
    private Vector m_allowedFilesList = new Vector();
    private boolean m_denyPhysicalPath = false;
    private String m_contentDisposition = "";
    public static final int SAVE_AUTO = 0;
    public static final int SAVE_VIRTUAL = 1;
    public static final int SAVE_PHYSICAL = 2;
    private SmartFiles m_files = new SmartFiles();
    private SmartRequest m_formRequest = new SmartRequest();
    private String[] FileNames;

    public SmartUpload() {
    }

    /** @deprecated */
    public final void init(ServletConfig servletconfig) throws ServletException {
        this.m_application = servletconfig.getServletContext();
    }

    /** @deprecated */
    public void service(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse) throws ServletException, IOException {
        this.m_request = httpservletrequest;
        this.m_response = httpservletresponse;
    }

    public final void initialize(ServletConfig servletconfig, HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse) throws ServletException {
        this.m_application = servletconfig.getServletContext();
        this.m_request = httpservletrequest;
        this.m_response = httpservletresponse;
    }

    public final void initialize(PageContext pagecontext) throws ServletException {
        this.m_application = pagecontext.getServletContext();
        this.m_request = (HttpServletRequest)pagecontext.getRequest();
        this.m_response = (HttpServletResponse)pagecontext.getResponse();
    }


    public final void initialize(ServletContext servletcontext, HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse) throws ServletException {
        this.m_application = servletcontext;
        this.m_request = httpservletrequest;
        this.m_response = httpservletresponse;
    }

    public void upload() throws ServletException, IOException, SmartUploadException {
        int i = 0;
        boolean flag1 = false;
        long l = 0L;
        String s4 = "";
        String s5 = "";
        String s6 = "";
        String s7 = "";
        String s8 = "";
        String s9 = "";
        String s10 = "";
        this.m_totalBytes = this.m_request.getContentLength();

        int j;
        for(this.m_binArray = new byte[this.m_totalBytes]; i < this.m_totalBytes; i += j) {
            try {
                j = this.m_request.getInputStream().read(this.m_binArray, i, this.m_totalBytes - i);
            } catch (Exception var17) {
                throw new SmartUploadException("Unable to upload.");
            }
        }

        for(; !flag1 && this.m_currentIndex < this.m_totalBytes; ++this.m_currentIndex) {
            if(this.m_binArray[this.m_currentIndex] == 13) {
                flag1 = true;
            } else {
                this.m_boundary = this.m_boundary + (char)this.m_binArray[this.m_currentIndex];
            }
        }

        if(this.m_currentIndex != 1) {
            ++this.m_currentIndex;

            while(this.m_currentIndex < this.m_totalBytes) {
                String s1 = this.getDataHeader();
                this.m_currentIndex += 2;
                boolean flag3 = s1.indexOf("filename") > 0;
                String s3 = this.getDataFieldValue(s1, "name");
                if(flag3) {
                    s6 = this.getDataFieldValue(s1, "filename");
                    s4 = this.getFileName(s6);
                    s5 = this.getFileExt(s4);
                    s7 = this.getContentType(s1);
                    s8 = this.getContentDisp(s1);
                    s9 = this.getTypeMIME(s7);
                    s10 = this.getSubTypeMIME(s7);
                }

                this.getDataSection();
                if(flag3 && s4.length() > 0) {
                    if(this.m_deniedFilesList.contains(s5)) {
                        throw new SecurityException("The extension of the file is denied to be uploaded (1015).");
                    }

                    if(!this.m_allowedFilesList.isEmpty() && !this.m_allowedFilesList.contains(s5)) {
                        throw new SecurityException("The extension of the file is not allowed to be uploaded (1010).");
                    }

                    if(this.m_maxFileSize > 0L && (long)(this.m_endData - this.m_startData + 1) > this.m_maxFileSize) {
                        throw new SecurityException("Size exceeded for this file : " + s4 + " (1105).");
                    }

                    l += (long)(this.m_endData - this.m_startData + 1);
                    if(this.m_totalMaxFileSize > 0L && l > this.m_totalMaxFileSize) {
                        throw new SecurityException("Total File Size exceeded (1110).");
                    }
                }

                if(flag3) {
                    SmartFile s11 = new SmartFile();
                    s11.setParent(this);
                    s11.setFieldName(s3);
                    s11.setFileName(s4);
                    s11.setFileExt(s5);
                    s11.setFilePathName(s6);
                    s11.setIsMissing(s6.length() == 0);
                    s11.setContentType(s7);
                    s11.setContentDisp(s8);
                    s11.setTypeMIME(s9);
                    s11.setSubTypeMIME(s10);
                    if(s7.indexOf("application/x-macbinary") > 0) {
                        this.m_startData += 128;
                    }

                    s11.setSize(this.m_endData - this.m_startData + 1);
                    s11.setStartData(this.m_startData);
                    s11.setEndData(this.m_endData);
                    this.m_files.addFile(s11);
                } else {
                    String var18 = new String(this.m_binArray, this.m_startData, this.m_endData - this.m_startData + 1, "UTF-8");
                    this.m_formRequest.putParameter(s3, var18);
                }

                if((char)this.m_binArray[this.m_currentIndex + 1] == 45) {
                    break;
                }

                this.m_currentIndex += 2;
            }

        }
    }

    public int save(String s) throws ServletException, IOException, SmartUploadException {
        return this.save(s, 0);
    }

    public int save(String s, int i) throws ServletException, IOException, SmartUploadException {
        int j = 0;
        if(s == null) {
            s = this.m_application.getRealPath("/");
        }

        if(s.indexOf("/") != -1) {
            if(s.charAt(s.length() - 1) != 47) {
                s = s + "/";
            }
        } else if(s.charAt(s.length() - 1) != 92) {
            s = s + "\\";
        }

        this.FileNames = new String[this.m_files.getCount()];

        for(int k = 0; k < this.m_files.getCount(); ++k) {
            if(!this.m_files.getFile(k).isMissing()) {
                this.m_files.getFile(k).saveAs(s + this.m_files.getFile(k).getFileName(), i);
                this.FileNames[j] = s + this.m_files.getFile(k).getFileName();
                ++j;
            }
        }

        return j;
    }

    public String[] getFileNames() {
        String[] vFileNames = new String[this.FileNames.length];
        System.arraycopy(this.FileNames, 0, vFileNames, 0, this.FileNames.length);
        return vFileNames;
    }

    public int getSize() {
        return this.m_totalBytes;
    }

    public byte getBinaryData(int i) {
        try {
            byte byte0 = this.m_binArray[i];
            return byte0;
        } catch (Exception var4) {
            throw new ArrayIndexOutOfBoundsException("Index out of range (1005).");
        }
    }

    public SmartFiles getFiles() {
        return this.m_files;
    }

    public SmartRequest getRequest() {
        return this.m_formRequest;
    }

    public void downloadFile(String s) throws ServletException, IOException, SmartUploadException {
        this.downloadFile(s, (String)null, (String)null);
    }

    public void downloadFile(String s, String s1) throws ServletException, IOException, SmartUploadException, SmartUploadException {
        this.downloadFile(s, s1, (String)null);
    }

    public void downloadFile(String s, String s1, String s2) throws ServletException, IOException, SmartUploadException {
        this.downloadFile(s, s1, s2, '\ufde8');
    }

    public void downloadFile(String s, String s1, String s2, int i) throws ServletException, IOException, SmartUploadException {
        if(s == null) {
            throw new IllegalArgumentException("File \'" + s + "\' not found (1040).");
        } else if(s.equals("")) {
            throw new IllegalArgumentException("File \'" + s + "\' not found (1040).");
        } else if(!this.isVirtual(s) && this.m_denyPhysicalPath) {
            throw new SecurityException("Physical path is denied (1035).");
        } else {
            if(this.isVirtual(s)) {
                s = this.m_application.getRealPath(s);
            }

            File file = new File(s);
            FileInputStream fileinputstream = new FileInputStream(file);
            long l = file.length();
            int k = 0;
            byte[] abyte0 = new byte[i];
            if(s1 == null) {
                this.m_response.setContentType("application/x-msdownload");
            } else if(s1.length() == 0) {
                this.m_response.setContentType("application/x-msdownload");
            } else {
                this.m_response.setContentType(s1);
            }

            this.m_response.setContentLength((int)l);
            this.m_contentDisposition = this.m_contentDisposition != null?this.m_contentDisposition:"attachment;";
            if(s2 == null) {
                this.m_response.setHeader("Content-Disposition", this.m_contentDisposition + " filename=" + new String(this.getFileName(s).getBytes(), "ISO-8859-1"));
            } else if(s2.length() == 0) {
                this.m_response.setHeader("Content-Disposition", this.m_contentDisposition);
            } else {
                this.m_response.setHeader("Content-Disposition", this.m_contentDisposition + " filename=" + new String(s2.getBytes(), "ISO-8859-1"));
            }

            while((long)k < l) {
                int j = fileinputstream.read(abyte0, 0, i);
                k += j;
                this.m_response.getOutputStream().write(abyte0, 0, j);
                this.m_response.flushBuffer();
            }

            fileinputstream.close();
        }
    }

    public void downloadField(ResultSet resultset, String s, String s1, String s2) throws ServletException, IOException, SQLException {
        if(resultset == null) {
            throw new IllegalArgumentException("The RecordSet cannot be null (1045).");
        } else if(s == null) {
            throw new IllegalArgumentException("The columnName cannot be null (1050).");
        } else if(s.length() == 0) {
            throw new IllegalArgumentException("The columnName cannot be empty (1055).");
        } else {
            byte[] abyte0 = resultset.getBytes(s);
            if(s1 == null) {
                this.m_response.setContentType("application/x-msdownload");
            } else if(s1.length() == 0) {
                this.m_response.setContentType("application/x-msdownload");
            } else {
                this.m_response.setContentType(s1);
            }

            this.m_response.setContentLength(abyte0.length);
            if(s2 == null) {
                this.m_response.setHeader("Content-Disposition", "attachment;");
            } else if(s2.length() == 0) {
                this.m_response.setHeader("Content-Disposition", "attachment;");
            } else {
                this.m_response.setHeader("Content-Disposition", "attachment; filename=" + s2);
            }

            this.m_response.getOutputStream().write(abyte0, 0, abyte0.length);
        }
    }

    public void fieldToFile(ResultSet resultset, String s, String s1) throws ServletException, IOException, SmartUploadException, SQLException {
        try {
            if(this.m_application.getRealPath(s1) != null) {
                s1 = this.m_application.getRealPath(s1);
            }

            InputStream exception = resultset.getBinaryStream(s);
            FileOutputStream fileoutputstream = new FileOutputStream(s1);

            int i;
            while((i = exception.read()) != -1) {
                fileoutputstream.write(i);
            }

            fileoutputstream.close();
        } catch (Exception var7) {
            throw new SmartUploadException("Unable to save file from the DataBase (1020).");
        }
    }

    private String getDataFieldValue(String s, String s1) {
        String s2 = "";
        String s3 = "";
        boolean i = false;
        s2 = s1 + "=" + '\"';
        int i1 = s.indexOf(s2);
        if(i1 > 0) {
            int j = i1 + s2.length();
            s2 = "\"";
            int l = s.indexOf(s2, j);
            if(j > 0 && l > 0) {
                s3 = s.substring(j, l);
            }
        }

        return s3;
    }

    private String getFileExt(String s) {
        boolean i = false;
        boolean j = false;
        if(s == null) {
            return null;
        } else {
            int i1 = s.lastIndexOf(46) + 1;
            int j1 = s.length();
            String s1 = s.substring(i1, j1);
            return s.lastIndexOf(46) > 0?s1:"";
        }
    }

    private String getContentType(String s) {
        String s1 = "";
        String s2 = "";
        boolean i = false;
        s1 = "Content-Type:";
        int i1 = s.indexOf(s1) + s1.length();
        if(i1 != -1) {
            int j = s.length();
            s2 = s.substring(i1, j);
        }

        return s2;
    }

    private String getTypeMIME(String s) {
        boolean i = false;
        int i1 = s.indexOf("/");
        return i1 != -1?s.substring(1, i1):s;
    }

    private String getSubTypeMIME(String s) {
        boolean i = false;
        int i1 = s.indexOf("/") + 1;
        if(i1 != -1) {
            int j = s.length();
            return s.substring(i1, j);
        } else {
            return s;
        }
    }

    private String getContentDisp(String s) {
        String s1 = "";
        boolean i = false;
        boolean j = false;
        int i1 = s.indexOf(":") + 1;
        int j1 = s.indexOf(";");
        s1 = s.substring(i1, j1);
        return s1;
    }

    private void getDataSection() {
        int i = this.m_currentIndex;
        int j = 0;
        int k = this.m_boundary.length();
        this.m_startData = this.m_currentIndex;
        this.m_endData = 0;

        while(i < this.m_totalBytes) {
            if(this.m_binArray[i] == (byte)this.m_boundary.charAt(j)) {
                if(j == k - 1) {
                    this.m_endData = i - k + 1 - 3;
                    break;
                }

                ++i;
                ++j;
            } else {
                ++i;
                j = 0;
            }
        }

        this.m_currentIndex = this.m_endData + k + 3;
    }

    private String getDataHeader() throws UnsupportedEncodingException {
        int i = this.m_currentIndex;
        int j = 0;
        boolean s = false;

        while(true) {
            while(!s) {
                if(this.m_binArray[this.m_currentIndex] == 13 && this.m_binArray[this.m_currentIndex + 2] == 13) {
                    s = true;
                    j = this.m_currentIndex - 1;
                    this.m_currentIndex += 2;
                } else {
                    ++this.m_currentIndex;
                }
            }

            String var4 = new String(this.m_binArray, i, j - i + 1, "UTF-8");
            return var4;
        }
    }

    private String getFileName(String s) {
        boolean i = false;
        int i1 = s.lastIndexOf(47);
        if(i1 != -1) {
            return s.substring(i1 + 1, s.length());
        } else {
            i1 = s.lastIndexOf(92);
            return i1 != -1?s.substring(i1 + 1, s.length()):s;
        }
    }

    public void setDeniedFilesList(String s) throws ServletException, IOException, SQLException {
        if(s != null) {
            String s2 = "";

            for(int i = 0; i < s.length(); ++i) {
                if(s.charAt(i) == 44) {
                    if(!this.m_deniedFilesList.contains(s2)) {
                        this.m_deniedFilesList.addElement(s2);
                    }

                    s2 = "";
                } else {
                    s2 = s2 + s.charAt(i);
                }
            }

            if(!s2.equals("")) {
                this.m_deniedFilesList.addElement(s2);
            }
        } else {
            this.m_deniedFilesList = null;
        }

    }

    public void setAllowedFilesList(String s) {
        if(s != null) {
            String s2 = "";

            for(int i = 0; i < s.length(); ++i) {
                if(s.charAt(i) == 44) {
                    if(!this.m_allowedFilesList.contains(s2)) {
                        this.m_allowedFilesList.addElement(s2);
                    }

                    s2 = "";
                } else {
                    s2 = s2 + s.charAt(i);
                }
            }

            if(!s2.equals("")) {
                this.m_allowedFilesList.addElement(s2);
            }
        } else {
            this.m_allowedFilesList = null;
        }

    }

    public void setDenyPhysicalPath(boolean flag) {
        this.m_denyPhysicalPath = flag;
    }

    public void setForcePhysicalPath(boolean flag) {
    }

    public void setContentDisposition(String s) {
        this.m_contentDisposition = s;
    }

    public void setTotalMaxFileSize(long l) {
        this.m_totalMaxFileSize = l;
    }

    public void setMaxFileSize(long l) {
        this.m_maxFileSize = l;
    }

    protected String getPhysicalPath(String s, int i) throws IOException {
        String s1 = "";
        String s2 = "";
        String s3 = "";
        boolean flag = false;
        s3 = System.getProperty("file.separator");
        if(s == null) {
            throw new IllegalArgumentException("There is no specified destination file (1140).");
        } else if(s.equals("")) {
            throw new IllegalArgumentException("There is no specified destination file (1140).");
        } else {
            if(s.lastIndexOf("\\") >= 0) {
                s1 = s.substring(0, s.lastIndexOf("\\"));
                s2 = s.substring(s.lastIndexOf("\\") + 1);
            }

            if(s.lastIndexOf("/") >= 0) {
                s1 = s.substring(0, s.lastIndexOf("/"));
                s2 = s.substring(s.lastIndexOf("/") + 1);
            }

            s1 = s1.length() != 0?s1:"/";
            File file = new File(s1);
            if(file.exists()) {
                flag = true;
            }

            if(i == 0) {
                if(this.isVirtual(s1)) {
                    s1 = this.m_application.getRealPath(s1);
                    if(s1.endsWith(s3)) {
                        s1 = s1 + s2;
                    } else {
                        s1 = s1 + s3 + s2;
                    }

                    return s1;
                } else if(flag) {
                    if(this.m_denyPhysicalPath) {
                        throw new IllegalArgumentException("Physical path is denied (1125).");
                    } else {
                        return s;
                    }
                } else {
                    throw new IllegalArgumentException("This path does not exist (1135).");
                }
            } else if(i == 1) {
                if(this.isVirtual(s1)) {
                    s1 = this.m_application.getRealPath(s1);
                    if(s1.endsWith(s3)) {
                        s1 = s1 + s2;
                    } else {
                        s1 = s1 + s3 + s2;
                    }

                    return s1;
                } else if(flag) {
                    throw new IllegalArgumentException("The path is not a virtual path.");
                } else {
                    throw new IllegalArgumentException("This path does not exist (1135).");
                }
            } else if(i == 2) {
                if(flag) {
                    if(this.m_denyPhysicalPath) {
                        throw new IllegalArgumentException("Physical path is denied (1125).");
                    } else {
                        return s;
                    }
                } else if(this.isVirtual(s1)) {
                    throw new IllegalArgumentException("The path is not a physical path.");
                } else {
                    throw new IllegalArgumentException("This path does not exist (1135).");
                }
            } else {
                return null;
            }
        }
    }

    public void uploadInFile(String s) throws IOException, SmartUploadException {
        boolean i = false;
        int j = 0;
        if(s == null) {
            throw new IllegalArgumentException("There is no specified destination file (1025).");
        } else if(s.length() == 0) {
            throw new IllegalArgumentException("There is no specified destination file (1025).");
        } else if(!this.isVirtual(s) && this.m_denyPhysicalPath) {
            throw new SecurityException("Physical path is denied (1035).");
        } else {
            int i1 = this.m_request.getContentLength();

            int k;
            for(this.m_binArray = new byte[i1]; j < i1; j += k) {
                try {
                    k = this.m_request.getInputStream().read(this.m_binArray, j, i1 - j);
                } catch (Exception var8) {
                    throw new SmartUploadException("Unable to upload.");
                }
            }

            if(this.isVirtual(s)) {
                s = this.m_application.getRealPath(s);
            }

            try {
                File exception1 = new File(s);
                FileOutputStream fileoutputstream = new FileOutputStream(exception1);
                fileoutputstream.write(this.m_binArray);
                fileoutputstream.close();
            } catch (Exception var7) {
                throw new SmartUploadException("The Form cannot be saved in the specified file (1030).");
            }
        }
    }

    private boolean isVirtual(String s) {
        if(this.m_application.getRealPath(s) != null) {
            File file = new File(this.m_application.getRealPath(s));
            return file.exists();
        } else {
            return false;
        }
    }
}
