import 'package:g_notes/src/core/factory/model_factory.dart';
import 'package:g_notes/src/features/notes/domain/entities/note.dart';

class NoteFactory extends ModelFactory<NoteEntity>{
  @override
  NoteEntity generateFake() {
    return NoteEntity(
      id: createFakeUuid(),
      userId: null,
      categoryId: null,
      category: faker.lorem.sentence(),
      title: faker.lorem.sentence(),
      content: faker.lorem.sentence(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  List<NoteEntity> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }
  
}