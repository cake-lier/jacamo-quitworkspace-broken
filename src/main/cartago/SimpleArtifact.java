import cartago.Artifact;
import cartago.OPERATION;

public class SimpleArtifact extends Artifact {
    @OPERATION
    public void op() {
        log("Operation invoked");
    }
}