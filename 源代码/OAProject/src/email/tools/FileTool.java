package email.tools;

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

public class FileTool {
	/**
	 * 拷贝上传的文件
	 * @param oldFile 旧的文件名
	 * @param newFile 新的文件名
	 */
	public static void copyFile(File oldFile, File newFile) {
		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
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
				inputStream.close();
				outputStream.flush();
				outputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
	/**
	 * 随机生成文件名
	 * @param oldFileName 旧的文件名
	 * @return
	 */
	public static  String makeNewFileName(String oldFileName) {
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
