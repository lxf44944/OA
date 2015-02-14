package email.service.inf;

import java.io.File;
import java.util.List;

import pojo.TEmail;
import pojo.TEmailFile;
import pojo.TReceiveemail;

public interface EmailServiceInf {
	//public void save(TEmail email);
	public void save(TEmail email,int type,List<File> emailFile,List<String> emailFileFileName,String receiveUserNames);
	public void update(TEmail email, int type, List<File> emailFile,List<String> emailFileFileName, String receiveUserNames);
	public String getReceiveUserNames(int emailId);
	public TReceiveemail getReceiveemail(int emailId);
	public boolean deleteFile(int nfileid);
	public TEmailFile getEmailFile(int fileid);
	public boolean setIsDel(int emailId,int type);
	public boolean emailList(int type);
	public String getSendUserName(int emailId);
	public List<String> getUserNameList();
	public boolean getUnreadCount();
}
