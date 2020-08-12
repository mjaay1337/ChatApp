import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp();
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//

export const addUserToFirestore = functions.auth
  .user()
  .onCreate((user, context) => {
    return admin.firestore().collection("users").add({
      id: user.uid,
      email: user.email,
    });
  });

// export const helloWorld = functions.https.onRequest((request, response) => {
//  functions.logger.info("Hello logs!", { structuredData: true });
//  response.send("Hello from Firebase!");
// });
