import org.gradle.api.Plugin;
import org.gradle.api.Project;
import org.gradle.api.Task;

public class MyPlugin implements Plugin<Project> {
    @Override
    public void apply(Project target) {
        Task task = target.task("runHi");
        task.doLast(it -> System.out.println(it + "你好"));
        task.doLast(it -> {
            for (int i = 0; i < 10; i++) {
                System.out.println(i);
            }
        });
    }
}
