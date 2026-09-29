import '../../../../core/widgets/status_pill.dart';
import '../../data/models/borrow_request.dart';

extension RequestStatusPresentation on RequestStatus {
  StatusTone get tone => switch (this) {
        RequestStatus.pending => StatusTone.pending,
        RequestStatus.accepted => StatusTone.accepted,
        RequestStatus.active => StatusTone.active,
        RequestStatus.rejected => StatusTone.rejected,
        RequestStatus.returned => StatusTone.returned,
      };

  String get label => switch (this) {
        RequestStatus.pending => 'Pending',
        RequestStatus.accepted => 'Accepted',
        RequestStatus.active => 'Active',
        RequestStatus.rejected => 'Rejected',
        RequestStatus.returned => 'Returned',
      };
}