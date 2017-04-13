package powerapi.common.utils;

import org.junit.Test;
import powerapi.dto.RequestDto;
import powerapi.entity.UnitTest;

import java.util.HashMap;

/**
 * Created by Melon on 2017/4/12.
 */
public class HttpUtilTest {

    @Test
    public void testGet() throws Exception {

        RequestDto requestDto = new RequestDto();
        requestDto.setMethod("GET");


        String url = "http://api.wanjingyiwei.com/act/list.do";
        requestDto.setUrl(url);
        HashMap<String, String> params = new HashMap<>();
        params.put("page", "0");
        UnitTest result = HttpUtil.doRequest(requestDto, params, null);
        System.out.println("--->>>" + result.toString());
    }

    @Test
    public void testPost() throws Exception {

    }
}