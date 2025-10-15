String getInitials(String name) {
  final parts = name.trim().split(' ');
  if (parts.length > 1) {
    return parts[0][0].toUpperCase() + parts[1][0].toUpperCase();
  } else if (parts.isNotEmpty) {
    return parts[0][0].toUpperCase();
  } else {
    return '';
  }
}
