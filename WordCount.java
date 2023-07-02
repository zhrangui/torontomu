import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class WordCount extends FileProcessor<List<Integer>>{
    int character;
    int word;
    int line;
    @Override
    protected void startFile(){
        word = 0;
        line = 0;
    }

    @Override
    protected void processLine(String line) {
        boolean isWhitespace = true;
        for (int i=0; i< line.length(); ++i) {
            Character c = line.charAt(i);
            ++character;
            if (Character.isWhitespace(c)) {
                isWhitespace = true;
            } else if (isWhitespace){
                ++word;
                isWhitespace = false;
            }
        }

        ++this.line;
    }

    @Override
    protected List<Integer> endFile() {
        return new ArrayList<Integer>(Arrays.asList(character, word, line));
    }
}
