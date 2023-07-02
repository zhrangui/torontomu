import java.util.ArrayList;
import java.util.List;

public class Tail extends FileProcessor<List<String>>{
    private int n;
    private List<String> lines;

    public Tail(int n) {
        this.n = n;
        lines = new ArrayList<>(2*n);
    }

    @Override
    protected void startFile(){
    }

    @Override
    protected void processLine(String line) {
        lines.add(line);
        if (lines.size() > n) {
            lines.remove(0);
        }
    }

    @Override
    protected  List<String> endFile() {
        return lines;
    }
}
