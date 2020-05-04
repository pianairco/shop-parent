package ir.piana.business.simpleshop.controller;

import com.google.api.client.googleapis.auth.oauth2.*;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import ir.piana.business.simpleshop.data.model.GoogleUserEntity;
import ir.piana.business.simpleshop.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Map;

import ir.piana.business.simpleshop.data.repository.GoogleUserRepository;

@RestController
public class GoogleAuthController {
    @Autowired
    GoogleUserRepository googleUserRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @PostMapping(path = "sample-shop/google-auth")
    public GoogleUserEntity refreshToken(RequestEntity requestEntity) {
//        https://developers.google.com/identity/sign-in/web/server-side-flow#java
        Map body = (Map) requestEntity.getBody();
        String code = (String)body.get("code");
        try {
//            RestTemplate restTemplate = new RestTemplate();
//            HttpHeaders headers = new HttpHeaders();
//            headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
//            MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
//            map.add("code",code);
//            map.add("client_id","290205995528-o268sq4cttuds0f44jnre5sb6rudfsb5.apps.googleusercontent.com");
//            map.add("client_secret","vTqJIybOJYxEho_XTv70rJBW");
//            map.add("grant_type","authorization_code");
//            map.add("redirect_uri","http://localhost");
//
//            HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(map, headers);
//
//            ResponseEntity<Map> response =
//                    restTemplate.exchange("https://oauth2.googleapis.com/token",
////                    restTemplate.exchange("https://www.googleapis.com/o/auth2/token",
//                            HttpMethod.POST,
//                            entity,
//                            Map.class);
//            String accessToken = (String)response.getBody().get("access_token");
//            GoogleCredential credential = new GoogleCredential().setAccessToken(accessToken);
            InputStream resourceAsStream = LoginService.class.getResourceAsStream(
                    "/client_secret_290205995528-o268sq4cttuds0f44jnre5sb6rudfsb5.apps.googleusercontent.com.json");

            GoogleClientSecrets clientSecrets =
                    GoogleClientSecrets.load(
                            JacksonFactory.getDefaultInstance(), new InputStreamReader(resourceAsStream));

            GoogleTokenResponse tokenResponse =
                    new GoogleAuthorizationCodeTokenRequest(
                            new NetHttpTransport(),
                            JacksonFactory.getDefaultInstance(),
                            "https://oauth2.googleapis.com/token",
                            clientSecrets.getDetails().getClientId(),//"290205995528-o268sq4cttuds0f44jnre5sb6rudfsb5.apps.googleusercontent.com",
                            clientSecrets.getDetails().getClientSecret(),//"vTqJIybOJYxEho_XTv70rJBW",
                            code,
                            "http://localhost")  // Specify the same redirect URI that you use with your web
                            // app. If you don't have a web version of your app, you can
                            // specify an empty string.
                            .execute();
            String accessToken = tokenResponse.getAccessToken();
            GoogleCredential credential = new GoogleCredential().setAccessToken(accessToken);
            GoogleIdToken idToken = tokenResponse.parseIdToken();
            GoogleIdToken.Payload payload = idToken.getPayload();
            String userId = payload.getSubject();  // Use this value as a key to identify a user.
            String email = payload.getEmail();
            boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
            String name = (String) payload.get("name");
            String pictureUrl = (String) payload.get("picture");
            String locale = (String) payload.get("locale");
            String familyName = (String) payload.get("family_name");
            String givenName = (String) payload.get("given_name");
            GoogleUserEntity googleUserEntity = null;
            googleUserEntity = googleUserRepository.findByUsername(email);
            if (googleUserEntity == null) {
                googleUserEntity = new GoogleUserEntity(userId, email, bCryptPasswordEncoder.encode("1234"),
                        emailVerified, name, pictureUrl, locale, familyName, givenName);
                googleUserRepository.save(googleUserEntity);
            }
            return googleUserEntity;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
