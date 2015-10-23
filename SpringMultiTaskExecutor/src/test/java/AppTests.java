
import static org.junit.Assert.*;

import java.util.List;

import com.emin.yuce.service.RetailerService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/resources/META-INF/spring/integration/spring-integration-context.xml" })
public class AppTests {

    @SuppressWarnings("SpringJavaAutowiringInspection")


    @Autowired
    public RetailerService retailerService;

    @Before
    public void setup() {

        System.out.print("Testing");


    }

    @Test
    public void findAllByStoreId() throws Exception {
        retailerService.findAllByStoreId(51);
    }
    @Test
    public void findRetailersByProductCode() throws Exception {
        retailerService.findRetailersByProductCode(51,"1");
    }
}
