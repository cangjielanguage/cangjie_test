package test;
import java.io.*;

public class InteropTest implements Serializable {
    private static final long serialVersionUID = 2624368016355021172L;

    public long firstName;
    public transient long lastName;
    public transient int description;

    public static void serialize(InteropTest interopTest) throws Exception {
        FileOutputStream file = new FileOutputStream("fileName.ser");
        ObjectOutputStream out = new ObjectOutputStream(file);
        out.writeObject(interopTest);
        out.close();
        file.close();
    }

    public static InteropTest deserialize() throws Exception {
        FileInputStream file = new FileInputStream("fileName.ser");
        ObjectInputStream in = new ObjectInputStream(file);
        InteropTest interopTest = (InteropTest) in.readObject();
        in.close();
        file.close();
        return interopTest;
    }
}
