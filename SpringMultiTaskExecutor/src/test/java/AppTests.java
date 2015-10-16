
import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/com/emin/yuce/OrderPersistenceTests-context.xml" })
public class AppTests {

    @SuppressWarnings("SpringJavaAutowiringInspection")

    @Before
    public void setup() {

        System.out.print("Testing");


    }

    @Test
    public void simple() throws Exception {

    }
}
