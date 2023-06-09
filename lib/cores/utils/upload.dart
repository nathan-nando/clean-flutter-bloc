part of 'util.dart';

class UploadUtil {
  final _imagePicker = ImagePicker();

  showModal(BuildContext context,
      {Function(String)? callbackOnDone,
        Function()? callbackOnStart,
        Function(dynamic err)? onError}) {
    showDialog(
        context: context,
        builder: (context) {
          return Text("");
          // return SourceFileDialog(
          //   onSelectCamera: () => selectImage(
          //       context, callbackOnDone, "CAMERA", callbackOnStart, onError),
          //   onSelectGallery: () => selectImage(
          //       context, callbackOnDone, "GALLERY", callbackOnStart, onError),
          // );
        });
  }
}