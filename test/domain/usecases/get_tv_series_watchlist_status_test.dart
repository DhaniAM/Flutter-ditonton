import 'package:ditonton/domain/usecases/get_tv_series_watchlist_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvSeriesWatchListStatus usecase;
  late MockTvSeriesRepository mockTvSerisRepository;

  setUp(() {
    mockTvSerisRepository = MockTvSeriesRepository();
    usecase = GetTvSeriesWatchListStatus(mockTvSerisRepository);
  });

  test('should get watchlist status from repository', () async {
    // arrange
    when(mockTvSerisRepository.isTvSeriesAddedToWatchlist(1))
        .thenAnswer((_) async => true);
    // act
    final result = await usecase.execute(1);
    // assert
    expect(result, true);
  });
}
