package test;

public class InteropTest  implements Cloneable {
    public boolean runTest() {
        try {
            InteropTest obj = new InteropTest();
            System.out.println(obj.hashCode());
            System.out.println(obj.clone().hashCode());
            System.out.println(obj.clone().equals(obj.clone()));
            return obj.clone() instanceof Object;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    @Override
    protected InteropTest clone(){
        InteropTest clone = null;
        try{
            clone = (InteropTest) super.clone();
        }catch(CloneNotSupportedException e){
            throw new RuntimeException(e);
        }
        return clone;
    }
}
