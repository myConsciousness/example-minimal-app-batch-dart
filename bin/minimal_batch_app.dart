import 'package:batch/batch.dart';

void main(List<String> args) => runWorkflow(
      jobs: [SayHelloWorldJob()],
    );

class SayHelloWorldJob implements ScheduledJobBuilder {
  @override
  ScheduledJob build() => ScheduledJob(
        name: 'Say Hello World Job',
        schedule: CronParser('*/2 * * * *'), // 2分毎に実行
        steps: [
          Step(name: 'Say Hello Step', task: SayHelloTask()),
          Step(name: 'Say World Step', task: SayWorldTask())
        ],
      );
}

class SayHelloTask extends Task<SayHelloTask> {
  @override
  void execute(ExecutionContext context) {
    log.info('Hello, ');
  }
}

class SayWorldTask extends Task<SayWorldTask> {
  @override
  void execute(ExecutionContext context) {
    log.info('World!');
  }
}
