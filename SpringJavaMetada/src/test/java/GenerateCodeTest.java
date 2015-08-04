
import static org.junit.Assert.*;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.mkyong.common.service.GenerateCode;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/SpringJUnitContext.xml")
public class GenerateCodeTest {

    @Autowired
    GenerateCode generateCode;

    public static Logger logger = Logger.getLogger(GenerateCodeTest.class);

    @Test
    public void test() {
        generateCode.generateScript();
        logger.debug(generateCode.getClass());
        assertEquals("Hello world, from Spring.", "Hello world, from Spring.");
    }
}