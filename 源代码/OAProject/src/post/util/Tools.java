package post.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 文件上传工具类 IO  获得新的文件名
 * @author admin
 *
 */
public class Tools {
	/**
	 * 拷贝文件的方法
	 * @param oldFile
	 * @param newFile
	 */
	public static void copyFile(File oldFile, File newFile) {
		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
			System.out.println(oldFile+"  oldFile");
			System.out.println(newFile+"  newFile");
			inputStream = new FileInputStream(oldFile);
			outputStream = new FileOutputStream(newFile);
			
			byte[] bs = new byte[102400];
			int read = -1;
			// read = inputStream.read(bs, 0, bs.length);
			while ((read = inputStream.read(bs, 0, bs.length)) != -1) {
				outputStream.write(bs, 0, read);
				// read = inputStream.read(bs, 0, bs.length);

			}
			outputStream.flush();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {
				if(inputStream!=null){
					inputStream.close();
				}
				if(outputStream!=null){
					outputStream.flush();
					outputStream.close();
				}
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
	
	/**
	 * 生成不重复的文件名
	 * @param oldFileName
	 * @return
	 */
	public static  String makeNewFileName(String oldFileName) {
		// tt.test.txt-->20120324164155444
		String ext = oldFileName.substring(oldFileName.lastIndexOf("."));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				"yyyyMMddHHmmssSSS");
		String time = simpleDateFormat.format(new Date());
		Random random = new Random();
		int r = random.nextInt(10000);
		String newFileName = time + r + ext;

		return newFileName;

	}

}
