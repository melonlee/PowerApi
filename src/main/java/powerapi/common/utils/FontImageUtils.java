package powerapi.common.utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;

/**
 * Created by Melon on 16/12/2.
 */
public class FontImageUtils {

    //根据str,font的样式以及输出文件目录
    public static void generateImage(String text, String filepath) throws Exception {

        File outFile = new File(filepath);

        Font font = new Font("黑体", Font.BOLD, 180);
        //创建图片
        BufferedImage image = new BufferedImage(180, 220, BufferedImage.TYPE_INT_BGR);
        Graphics g = image.getGraphics();
        g.setColor(Color.DARK_GRAY);
        g.fillRect(0, 0, 180, 220);//先用白色填充整张图片,也就是背景
        g.setColor(Color.white);//在换成黑色
        g.setFont(font);//设置画笔字体
        g.drawString(text, 0, font.getSize());//画出字符串
        g.dispose();
        ImageIO.write(image, "png", outFile);//输出png图片
    }
}